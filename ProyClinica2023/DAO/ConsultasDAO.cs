
using ProyClinica2023.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;



namespace ProyClinica2023.DAO
{
    public class ConsultasDAO
    {


        //LISTAR MEDICOS POR ANIO

        public List<sp_ListarCitasPorMedicoYAnio> sp_ListarCitasPorMedicoYAnio(string CodMedico = "", int fecha=0)
        {
            List<sp_ListarCitasPorMedicoYAnio> lista =new List<sp_ListarCitasPorMedicoYAnio> ();
       

            SqlDataReader dr = DBHelper.RetornaReader("sp_ListarCitasPorMedicoYAnio",CodMedico,fecha);

            sp_ListarCitasPorMedicoYAnio obj;

            while (dr.Read())
            {
                obj = new sp_ListarCitasPorMedicoYAnio();
                obj.nrocita=dr.GetInt32(0);
                obj.fecha = dr.GetDateTime(1);
                obj.codpac = dr.GetString(2);
                obj.nompac = dr.GetString(3);
                obj.pago = dr.GetDecimal(4);
                obj.descrip = dr.GetString(5);


                lista.Add(obj);

            }
            dr.Close();



            return lista;
        }



        public List <sp_ListarAniosCitas> sp_ListarAniosCitas()
        {
            List<sp_ListarAniosCitas> lista = new List<sp_ListarAniosCitas> ();

            SqlDataReader dr = DBHelper.RetornaReader("sp_ListarAniosCitas");

            sp_ListarAniosCitas obj;
            while (dr.Read())
            {
                obj = new sp_ListarAniosCitas();
                obj.fecha = dr.GetInt32(0);

                lista.Add(obj);
            }
            dr.Close();


            return lista;
        }


        public List<sp_ListarMedicos> sp_ListarMedicos()
        {
            List<sp_ListarMedicos> lista = new List<sp_ListarMedicos>();

            SqlDataReader dr = DBHelper.RetornaReader("sp_ListarMedicos");

            sp_ListarMedicos obj;
            while (dr.Read())
            {
                obj = new sp_ListarMedicos();
                obj.codmed = dr.GetString(0);
                obj.nommed = dr.GetString(1);

                lista.Add(obj);
            }
            dr.Close();


            return lista;
        }

        public List<Citas> ListarTodasLasCitas()
        {
            List<Citas> lista=new List<Citas>();
            SqlDataReader dr = DBHelper.RetornaReader("ListarTodasLasCitas");

            Citas obj;
            while(dr.Read())
            {


                obj= new Citas();
                obj.nrocita = dr.GetInt32(0);
                obj.codmed = dr.GetString(1);
                obj.codpac=dr.GetString(2);
                obj.tipo = dr.GetInt32(3);
                obj.pago = dr.GetDecimal(4);
                obj.fecha=dr.GetDateTime(5);
                obj.estado = dr.GetInt32(6);
                obj.descrip = dr.GetString(7);

                lista.Add(obj);

            }
            dr.Close ();



            return lista;
        }


        public List<ListarPacientes> ListarPacientes()
        {
            List<ListarPacientes> lista = new List<ListarPacientes>();

            SqlDataReader dr = DBHelper.RetornaReader("ListarPacientes");

            ListarPacientes obj;
            while (dr.Read())
            {
                obj = new ListarPacientes();
                obj.codpac = dr.GetString(0);
                obj.nompac = dr.GetString(1);

                lista.Add(obj);
            }
            dr.Close();


            return lista;
        }

         
        public string AgregarCita(Citas obj)
        {
            try
            {
             
                DBHelper.EjecutarSP("AgregarCita",
                    obj.codmed, obj.codpac, obj.tipo,
                    obj.pago, obj.fecha, obj.estado, obj.descrip);
                return $"Se agrego nuevo ariculo: {obj.nrocita}";
            }
            catch (Exception ex)
            {

                return "Error"+ex.Message;
            }


         
        }

        public string ActualizarCitaPorNroCita(Citas obj)
        {
            try
            {

                DBHelper.EjecutarSP("ActualizarCitaPorNroCita",
                    obj.nrocita,obj.codmed, obj.codpac, obj.tipo,
                    obj.pago, obj.fecha, obj.estado, obj.descrip);
                return $"Se Actualizo ariculo: {obj.nrocita}";
            }
            catch (Exception ex)
            {

                return "Error" + ex.Message;
            }



        }
    }
}