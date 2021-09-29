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
    public class ProductsController : Controller
    {
        private readonly mallDBContext _context;
        private readonly IWebHostEnvironment environment;

        public ProductsController(mallDBContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            environment = hostEnvironment;
        }

        // GET: Products
        public async Task<IActionResult> Index(string searchString)
        {
            var mallDBContext = from m in _context.Products.Include(p => p.Brand).Include(p => p.Store) select m;
            if (!String.IsNullOrEmpty(searchString)) { 
                mallDBContext = mallDBContext.Where(s=>s.Category.Contains(searchString));
            }
            
            return View(await mallDBContext.ToListAsync());
        }

        // GET: Products/Details/5
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

            var product = await _context.Products
                .Include(p => p.Brand)
                .Include(p => p.Store)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }
        public async Task<IActionResult> DetailsClient(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Brand)
                .Include(p => p.Store)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "BrandName");
            ViewData["StoreId"] = new SelectList(_context.Stores, "StoreId", "StoreId");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(int id, [Bind("ProductId,ProductName,StoreId,BrandId,Category,ImageName,ImageFile")] Product product)
        {
            if (ModelState.IsValid)
            {
                
                string fileName = Path.GetFileName(product.ImageFile.FileName);
                string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
                using (var fileStream = new FileStream(file_path, FileMode.Create))
                {
                    await product.ImageFile.CopyToAsync(fileStream);
                }
                product.ImageName = "Images/" + fileName;
                _context.Add(product);
                product.StoreId = id;
                await _context.SaveChangesAsync();
                return RedirectToAction("StoreDetails", "Plots", new { id = id });
            }
            
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "BrandName", product.BrandId);

            return View(product);
        }

        // GET: Products/Edit/5
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

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "BrandName", product.BrandId);

            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,int storeid, [Bind("ProductId,ProductName,StoreId,BrandId,Category,ImageName,ImageFile")] Product product)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    string fileName = Path.GetFileName(product.ImageFile.FileName);
                    string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
                    using (var fileStream = new FileStream(file_path, FileMode.Create))
                    {
                        await product.ImageFile.CopyToAsync(fileStream);
                    }
                    product.ImageName = "Images/" + fileName;
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
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
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "BrandName", product.BrandId);

            return View(product);
        }

        // GET: Products/Delete/5
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

            var product = await _context.Products
                .Include(p => p.Brand)
                .Include(p => p.Store)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id, int storeid)
        {
            var product = await _context.Products.FindAsync(id);
            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
            return RedirectToAction("StoreDetails", "Plots", new { id = storeid });

        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
