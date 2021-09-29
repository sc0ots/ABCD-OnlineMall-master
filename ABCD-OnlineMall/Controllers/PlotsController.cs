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
using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;

namespace ABCD_OnlineMall.Controllers
{
    public class PlotsController : Controller
    {
        private readonly mallDBContext _context;
        private readonly IWebHostEnvironment environment;

        public PlotsController(mallDBContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            environment = hostEnvironment;
        }

        // GET: Plots
        public async Task<IActionResult> Index()
        {
            var mallDBContext = _context.Plots.Include(p => p.Store);
            return View(await mallDBContext.ToListAsync());
        }
        public async Task<IActionResult> IndexAdmin()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            var mallDBContext = _context.Plots.Include(p => p.Store);
            return View(await mallDBContext.ToListAsync());
        }


        private bool PlotExists(int id)
        {
            return _context.Plots.Any(e => e.PlotId == id);
        }
        // GET: Plots/CreateStore
        public async Task<IActionResult> CreateStore(int? id)
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            if (id == null)
            {
                return NotFound();
            }
            var plot = await _context.Plots.FindAsync(id);
            if (plot == null)
            {
                return NotFound();
            }
            ViewData["StoreId"] = new SelectList(_context.Stores, "StoreId", "StoreId", plot.StoreId);
            return View(plot.Store);
        }

        // POST: Plots/CreateStore
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateStore(int id,[Bind("StoreId,StoreName,OpenTime,CloseTime,PromoImageName,StoreAbout,StoreDescription,StoreCategory,PlotId,ImageName,ImageFile,ImagePromo")] Store store)
        {

            if (ModelState.IsValid)
            {
                
                store.PlotId = id;
                var plot = await _context.Plots.FindAsync(id);        
                plot.IsEmpty = false;
                string fileName = Path.GetFileName(store.ImageFile.FileName);
                string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
                using (var fileStream = new FileStream(file_path, FileMode.Create))
                {
                    await store.ImageFile.CopyToAsync(fileStream);
                }
                store.ImageName = "Images/" + fileName;
                string fileName2 = Path.GetFileName(store.ImagePromo.FileName);
                string file_path2 = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName2);
                using (var fileStream2 = new FileStream(file_path2, FileMode.Create))
                {
                    await store.ImagePromo.CopyToAsync(fileStream2);
                }
                store.PromoImageName = "Images/" + fileName2;
                _context.Add(store);            
                await _context.SaveChangesAsync();
                plot.StoreId = store.StoreId;
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(IndexAdmin));
                ViewData["PlotId"] = new SelectList(_context.Plots, "PlotId", "PlotId", store.PlotId);
            }
            return RedirectToAction(nameof(IndexAdmin));
        }
        public async Task<IActionResult> StoreDetails(int? id)
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            if (id == null)
            {
                return NotFound();
            }
            var model = new Sharemodel1();
            model.Stores =  await _context.Stores
            .Include(s => s.Plot)
            .FirstOrDefaultAsync(m => m.StoreId ==  id);
            model.Products = _context.Products.Where(p => p.StoreId == id).ToList();
            model.Brands = _context.Brands.Where(b => b.StoreId == id).ToList();
            if (model == null)
            {
                return NotFound();
            }
            return View(model);
        }
        public async Task<IActionResult> StoreDetailsClient(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var model = new Sharemodel1();
            model.Stores = await _context.Stores
            .Include(s => s.Plot)
            .FirstOrDefaultAsync(m => m.StoreId == id);
            model.Products = _context.Products.Where(p => p.StoreId == id).ToList();
            model.Brands = _context.Brands.Where(b => b.StoreId == id).ToList();
            if (model == null)
            {
                return NotFound();
            }
            return View(model);
        }
        // GET: Plots/Delete/5
        public async Task<IActionResult> DeleteStore(int? id)
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            if (id == null)
            {
                return NotFound();
            }
            var store = await _context.Stores
                .Include(s => s.Plot)
                .FirstOrDefaultAsync(m => m.Plot.PlotId == id);
            if (store == null)
            {
                return NotFound();
            }
            return View(store);
        }

        // POST: Plots/Delete/5
        [HttpPost, ActionName("DeleteStore")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteStoreConfirmed(int id, int storeid)   
        {
            var store = await _context.Stores.Include(s => s.Plot).Include(p => p.Products).Include(b => b.Brands).FirstOrDefaultAsync(m => m.Plot.PlotId == id);
            var brand = await _context.Brands.Where(p => p.StoreId == id).ToListAsync();
            var product = await _context.Products.Where(p => p.StoreId == id).ToListAsync();
            foreach (var item2 in brand)
            {
                _context.Brands.Remove(item2);
            }

            foreach (var item in product)
            {
                _context.Products.Remove(item);
            }

            store.Brands.Clear();
            store.Products.Clear();
            store.Plot.IsEmpty = true;
            store.Plot.StoreId = null;
            
            string fileName = Path.GetFileName(store.ImageName);
            string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
            if (System.IO.File.Exists(file_path))
            {
                System.IO.File.Delete(file_path);
            }
            string fileName1 = Path.GetFileName(store.PromoImageName);
            string file_path1 = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName1);
            if (System.IO.File.Exists(file_path1))
            {
                System.IO.File.Delete(file_path1);
            }

            _context.Stores.Remove(store);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(IndexAdmin));
        }
        // GET: Stores/Edit/5
        public async Task<IActionResult> EditStore(int? id)
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            if (id == null)
            {
                return NotFound();
            }
            var store = await _context.Stores
                .Include(s => s.Plot)
                .FirstOrDefaultAsync(m => m.Plot.PlotId == id);
            if (store == null)
            {
                return NotFound();
            }
            ViewData["PlotId"] = new SelectList(_context.Plots, "PlotId", "PlotId", store.PlotId);
            return View(store);
        }
        [HttpPost, ActionName("EditStore")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditStore(int id, [Bind("StoreId,StoreName,OpenTime,CloseTime,ImageName,PromoImageName,StoreAbout,StoreDescription,StoreCategory,PlotId,Imagefile,ImagePromo")] Store store)
        {
            if (id != store.PlotId)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return RedirectToAction(nameof(Index));
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
            return RedirectToAction(nameof(Index));

            ViewData["PlotId"] = new SelectList(_context.Plots, "PlotId", "PlotId", store.PlotId);
            return View(store);

        }
        // GET: Brands/Create
        
        private bool StoreExists(int id)
        {
            return _context.Stores.Any(e => e.StoreId == id);
        }
    }
}
