using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using WebAPI2_University.Models;

namespace WebAPI2_University.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "Accept, Origin, Content-Type", methods: "PUT,OPTIONS,GET,POST,DELETE")]
    public class studentController : ApiController
    {
        private EDMUniversity db = new EDMUniversity();

        // GET: api/student
        public IQueryable<student> Getstudents()
        {
            return db.students;
        }

        // GET: api/student/5
        [ResponseType(typeof(student))]
        public IHttpActionResult Getstudents(int id)
        {
            student students = db.students.Find(id);
            if (students == null)
            {
                return NotFound();
            }

            return Ok(students);
        }

        // PUT: api/student/5
        //[EnableCors(origins: "http://localhost:8000", headers: "Accept, Origin, Content-Type, Access-Control-Allow-Origin", methods: "OPTIONS,PUT")]
        [ResponseType(typeof(void))]
        public IHttpActionResult Putstudents(int id, student student)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != student.id)
            {
                return BadRequest();
            }

            db.Entry(student).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!studentsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/student
        /*[ResponseType(typeof(student))]
        public IHttpActionResult Poststudents(string firstName, string lastName)
        {
            student newStudent = new student();
            newStudent.first_name = firstName;
            newStudent.last_name = lastName;
            newStudent.id = 0;

            db.student.Add(newStudent);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = newStudent.id }, newStudent);
        }*/

        // POST: api/student
        [ResponseType(typeof(student))]
        public IHttpActionResult Poststudents(student student)
        {
            if (!ModelState.IsValid)
            {
                //var errors = this.ModelState.Keys.SelectMany(key => this.ModelState[key].Errors);
                return BadRequest(ModelState);
            }

            db.students.Add(student);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = student.id }, student);
        }

        // DELETE: api/student/5
        [ResponseType(typeof(student))]
        public IHttpActionResult Deletestudents(int id)
        {
            student students = db.students.Find(id);
            if (students == null)
            {
                return NotFound();
            }

            db.students.Remove(students);
            db.SaveChanges();

            return Ok(students);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool studentsExists(int id)
        {
            return db.students.Count(e => e.id == id) > 0;
        }
    }
}