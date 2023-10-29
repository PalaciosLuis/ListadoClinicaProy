using ProyClinica2023.DAO;
using ProyClinica2023.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyClinica2023.Controllers
{
    public class CitasController : Controller
    {
        // GET: Citas


        ConsultasDAO consultas=new ConsultasDAO();


        public ActionResult sp_ListarCitasPorMedicoYAnio(string codMedico="",int fecha = 0)
        {

            var listado=consultas.sp_ListarCitasPorMedicoYAnio(codMedico, fecha);


            ViewBag.contador = listado.Count;
            ViewBag.suma_citas = listado.Sum(x => x.pago);
            ViewBag.anio_cita = new SelectList(consultas.sp_ListarAniosCitas(),"fecha","fecha");
            ViewBag.listar_medicos = new SelectList(consultas.sp_ListarMedicos(), "codmed", "nommed");


            return View(listado);
        }

        // GET: Citas/Details/5
        public ActionResult ListarCitas()
        {
            var listado=consultas.ListarTodasLasCitas();
            ViewBag.contador = listado.Count;
            ViewBag.suma_citas = listado.Sum(x => x.pago);
            return View(listado);
        }

        // GET: Citas/Create
        public ActionResult NuevaCita()
        {
            Citas nuevo = new Citas();
            nuevo.nrocita = 10341;
            nuevo.fecha = new DateTime(2000, 05, 10);
            //
            ViewBag.pacientes = new SelectList(consultas.ListarPacientes(), "codpac", "nompac");
            ViewBag.listar_medicos = new SelectList(consultas.sp_ListarMedicos(), "codmed", "nommed");


            //
            return View(nuevo);
        }

        //public ActionResult ActualizarCitaPorNroCita()
        //{
        //    ViewBag.pacientes = new SelectList(consultas.ListarPacientes(), "codpac", "nompac");
        //    ViewBag.listar_medicos = new SelectList(consultas.sp_ListarMedicos(), "codmed", "nommed");

        //    return View();
        //}

        // POST: Citas/Create
        [HttpPost]
        public ActionResult NuevaCita(Citas obj)
        {
            try
            {
                if (ModelState.IsValid == true)
                    ViewBag.Mensaje = consultas.AgregarCita(obj);
                
             

            }
            catch(Exception ex)
            {
                ViewBag.Mensaje = ex.Message;
            }

            //

            ViewBag.pacientes = new SelectList(consultas.ListarPacientes(), "codpac", "nompac");
            ViewBag.listar_medicos = new SelectList(consultas.sp_ListarMedicos(), "codmed", "nommed");

            //

            return View(obj);
        }

        // GET: Citas/Edit/5
        public ActionResult ActualizarCitaPorNroCita(int id)
        {
            Citas nuevo = new Citas();
            nuevo.nrocita = id;
            nuevo.fecha = new DateTime(2000, 05, 10);

            ViewBag.pacientes = new SelectList(consultas.ListarPacientes(), "codpac", "nompac");
            ViewBag.listar_medicos = new SelectList(consultas.sp_ListarMedicos(), "codmed", "nommed");
            return View(nuevo);
        }

        // POST: Citas/Edit/5
        [HttpPost]
        public ActionResult ActualizarCitaPorNroCita(int id, Citas obj)
        {
            try
            {
                if (ModelState.IsValid == true)
                    ViewBag.Mensaje = consultas.ActualizarCitaPorNroCita(obj);
                

            }
            catch(Exception ex)
            {
                ViewBag.Mensaje = ex.Message;

            }

            ViewBag.pacientes = new SelectList(consultas.ListarPacientes(), "codpac", "nompac");
            ViewBag.listar_medicos = new SelectList(consultas.sp_ListarMedicos(), "codmed", "nommed");

            return View(obj);
        }

     
    }
}
