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
using Microsoft.AspNetCore.Http;

namespace ABCD_OnlineMall.Controllers
{
    public class BrandsController : Controller
    {
        private readonly mallDBContext _context;
        
        private readonly IWebHostEnvironment environment;

        public BrandsController(mallDBContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            environment = hostEnvironment;
        }

        // GET: Brands
        public async Task<IActionResult> Index()
        {
            var mallDBContext = _context.Brands.Include(b => b.Store);
            return View(await mallDBContext.ToListAsync());
        }

        // GET: Brands/Details/5
        public async Task<IActionResult> Details(int? id)
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

            var brand = await _context.Brands
                .Include(b => b.Store)
                .FirstOrDefaultAsync(m => m.BrandId == id);
            
               
                
            if (brand == null)
            {
                return NotFound();
            }

            return View(brand);
        }
        public async Task<IActionResult> DetailsClient(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var model = new Sharemodel2();
            model.Brands = await _context.Brands.Include(b => b.Store)
                .FirstOrDefaultAsync(m => m.BrandId == id);
            model.Products = await _context.Products.Where(p => p.BrandId == id).ToListAsync();

            
            if (model == null)
            {
                return NotFound();
            }

            return View(model);
        }
        // GET: Brands/Create
        public IActionResult Create()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            ViewData["StoreName"] = new SelectList(_context.Stores, "StoreName", "StoreName");
            ViewData["StoreId"] = new SelectList(_context.Stores, "StoreId", "StoreId");
            return View();
        }

        // POST: Brands/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(int id,[Bind("BrandId,BrandName,BrandUrl,ImageName,StoreId,ImageFile")] Brand brand)
        {
            if (ModelState.IsValid)
            {
              string fileName = Path.GetFileName(brand.ImageFile.FileName);
                string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
                using (var fileStream = new FileStream(file_path, FileMode.Create))
                {
                    await brand.ImageFile.CopyToAsync(fileStream);
                }
                brand.ImageName = "Images/" + fileName;
                _context.Add(brand);
                brand.StoreId = id;
                await _context.SaveChangesAsync();
                return RedirectToAction("StoreDetails", "Plots", new { id = id });
            }
            
            return View(brand);
        }

        // GET: Brands/Edit/5
        public async Task<IActionResult> Edit(int? id)
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

            var brand = await _context.Brands.FindAsync(id);
            if (brand == null)
            {
                return NotFound();
            }
            
            
            return View(brand);
        }

        // POST: Brands/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, int storeid,[Bind("BrandId,BrandName,BrandUrl,ImageName,StoreId,ImageFile")] Brand brand)
        {
            if (id != brand.BrandId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    string fileName = Path.GetFileName(brand.ImageFile.FileName);
                    string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
                    using (var fileStream = new FileStream(file_path, FileMode.Create))
                    {
                        await brand.ImageFile.CopyToAsync(fileStream);
                    }
                    brand.ImageName = "Images/" + fileName;
                    _context.Update(brand);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BrandExists(brand.BrandId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("StoreDetails", "Plots", new { id = storeid });
            }
            ViewData["StoreId"] = new SelectList(_context.Stores, "StoreId", "StoreId", brand.StoreId);
            return View(brand);
        }

        // GET: Brands/Delete/5
        public async Task<IActionResult> Delete(int? id)
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

            var brand = await _context.Brands
                
                .Include(b => b.Store)
                .FirstOrDefaultAsync(m => m.BrandId == id);
            if (brand == null)
            {
                return NotFound();
            }

            return View(brand);
        }

        // POST: Brands/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id, int storeid)
        {
            var brand = await _context.Brands.FindAsync(id);
            var product= await _context.Products.Where(p=>p.BrandId==id).ToListAsync();
            brand.Products.Clear();
            _context.Brands.Remove(brand);
            foreach (var item in product) {
            _context.Products.Remove(item);
            }
            await _context.SaveChangesAsync();
            return RedirectToAction("StoreDetails", "Plots", new { id = storeid });
        }

        private bool BrandExists(int id)
        {
            return _context.Brands.Any(e => e.BrandId == id);
        }
    }
}
