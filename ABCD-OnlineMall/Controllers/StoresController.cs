using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ABCD_OnlineMall.Models;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace ABCD_OnlineMall.Controllers
{
    public class StoresController : Controller
    {
        private readonly mallDBContext _context;
        private readonly IWebHostEnvironment environment;

        public StoresController(mallDBContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            environment = hostEnvironment;
        }

        // GET: Stores
        public async Task<IActionResult> Index(string searchString)
        {
            
            var mallDBContext =from m in _context.Stores.Include(s => s.Plot) select m;
            if (!String.IsNullOrEmpty(searchString))
            {
                mallDBContext = mallDBContext.Where(s => s.StoreName.Contains(searchString));
            }
            return View(await mallDBContext.ToListAsync());
        }
        public async Task<IActionResult> IndexFood()
        {

            var mallDBContext =  _context.Stores.Include(s => s.Plot).Where(s=>s.StoreCategory.Equals("Food"));
            
            return View(await mallDBContext.ToListAsync());
        }
        public async Task<IActionResult> IndexClothing()
        {

            var mallDBContext = _context.Stores.Include(s => s.Plot).Where(s => s.StoreCategory.Equals("Clothing"));

            return View(await mallDBContext.ToListAsync());
        }
        public async Task<IActionResult> IndexOther()
        {

            var mallDBContext = _context.Stores.Include(s => s.Plot).Where(s => s.StoreCategory.Equals("Other"));

            return View(await mallDBContext.ToListAsync());
        }


        // GET: Stores/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var store = await _context.Stores.FindAsync(id);
            if (store == null)
            {
                return NotFound();
            }
            ViewData["PlotId"] = new SelectList(_context.Plots, "PlotId", "PlotId", store.PlotId);
            return View(store);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("StoreId,StoreName,OpenTime,CloseTime,StoreAbout,ImageName,PromoImageName,StoreDescription,StoreCategory,PlotId,ImageFile,ImagePromo")] Store store)
        {
            if (id != store.StoreId)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return RedirectToAction("IndexAdmin", "Plots");
            }

            if (store.ImageFile != null)
            {
                string fileName = Path.GetFileName(store.ImageFile.FileName);
                string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
                using (var fileStream = new FileStream(file_path, FileMode.Create))
                {
                    await store.ImageFile.CopyToAsync(fileStream);
                }
                store.ImageName = "Images/" + fileName;
            }

            
            if (store.ImagePromo != null)
            {
                string fileName2 = Path.GetFileName(store.ImagePromo.FileName);
                string file_path2 = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName2);
                using (var fileStream2 = new FileStream(file_path2, FileMode.Create))
                {
                    await store.ImagePromo.CopyToAsync(fileStream2);
                }
                store.PromoImageName = "Images/" + fileName2;
            }
            _context.Attach(store).State = EntityState.Modified;


            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StoreExists(store.StoreId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return RedirectToAction("IndexAdmin","Plots");
            ViewData["PlotId"] = new SelectList(_context.Plots, "PlotId", "PlotId", store.PlotId);
            return View(store);
        }



        private bool StoreExists(int id)
        {
            return _context.Stores.Any(e => e.StoreId == id);
        }
       
    }
}
