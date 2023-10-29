using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyClinica2023.Models
{
    public class sp_ListarCitasPorMedicoYAnio
    {

        public int nrocita { get; set; }
        public DateTime fecha { get; set; }
        public string codpac { get; set; }
        public string nompac { get; set; }
        public decimal pago { get; set; }
        public string descrip { get; set; }
    }
}