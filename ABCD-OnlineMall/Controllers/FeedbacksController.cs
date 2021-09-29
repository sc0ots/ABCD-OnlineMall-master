using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ABCD_OnlineMall.Models;
using Microsoft.AspNetCore.Http;

namespace ABCD_OnlineMall.Controllers
{
    public class FeedbacksController : Controller
    {
        private readonly mallDBContext _context;

        public FeedbacksController(mallDBContext context)
        {
            _context = context;
        }

        // GET: Feedbacks
        public async Task<IActionResult> Index()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View(await _context.Feedbacks.ToListAsync());
        }

        // GET: Feedbacks/Details/5
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

            var feedback = await _context.Feedbacks
                .FirstOrDefaultAsync(m => m.FeedbackId == id);
            if (feedback == null)
            {
                return NotFound();
            }

            return View(feedback);
        }

        // GET: Feedbacks/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Feedbacks/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("FeedbackId,FeedbackSubject,FeedbackContent,UserEmail,FeedbackDate")] Feedback feedback)
        {
            if (ModelState.IsValid)
            {
                feedback.FeedbackDate = DateTime.Today;
                _context.Add(feedback);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index","Home");
            }
            return View(feedback);
        }

       

       
        // GET: Feedbacks/Delete/5
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

            var feedback = await _context.Feedbacks
                .FirstOrDefaultAsync(m => m.FeedbackId == id);
            if (feedback == null)
            {
                return NotFound();
            }

            return View(feedback);
        }

        // POST: Feedbacks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var feedback = await _context.Feedbacks.FindAsync(id);
            _context.Feedbacks.Remove(feedback);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool FeedbackExists(int id)
        {
            return _context.Feedbacks.Any(e => e.FeedbackId == id);
        }
    }
}
