using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyClinica2023.Models
{
    public class Citas
    {
        public int nrocita { get; set; }
        public string codmed { get; set; }
        public string codpac { get; set;}
        public int tipo { get; set; }
        public decimal pago { get; set; }
        public DateTime fecha { get; set; }
        public int estado { get; set; }
        public string descrip { get; set; }




    }
}