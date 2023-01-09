using System;
using System.Data;
using System.Linq;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System.Xml.Xsl;
using System.Text;

namespace Cemetlib.Common
{
    public class Log
    {
        private static string _sRuta = string.Empty;
        private static string CreaLog(bool esError = false)
        {
            string NombreArchivo = string.Format("ActualizaFacturacion{0}{1}", "_", DateTime.Now.ToString("yyyyMMdd"));
            string ruta = @"C:\" + NombreArchivo;

            try
            {
                ruta = NombreArchivo + (esError ? "_error" : string.Empty) + ".log";
                _sRuta = ruta.Trim();

                if (!File.Exists(ruta))
                {
                    Console.WriteLine(Directory.GetCurrentDirectory());
                    Console.WriteLine(ruta);

                    using (StreamWriter sw = File.CreateText(ruta))
                    {
                        sw.WriteLine(string.Format("Archivo creado el {0} \n", DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss.fff")));
                    }

                    DirectoryInfo di = new DirectoryInfo(ruta);
                    Console.WriteLine(di.FullName);

                    if (Directory.Exists(di.Parent.FullName))
                    {
                        EliminaLOGantiguo(di.Parent.FullName);
                    }
                }
            }
            catch
            { }
            finally
            { }

            return ruta;
        }
        public static void EscribeLog(string texto, bool esError = false)
        {
            string archivoLog = CreaLog(esError);
            StreamWriter sw = new StreamWriter(archivoLog, true);

            try
            {
                texto = string.Format("{0} {1}", DateTime.Now.ToString("HH:mm:ss.fff"), texto);
                sw.WriteLine(texto);
            }
            catch
            { }
            finally
            {
                if (sw != null)
                {
                    sw.Dispose();
                    GC.SuppressFinalize(sw);
                }
            }
        }
        public static void RegistraExcepcion(Exception ex)
        {
            string msj;

            msj = string.Format("Error: {0}", ex.Message);

            if (ex.InnerException != null) { msj = msj + " " + ex.InnerException.Message; }
            if (ex.Source != null) { msj = msj + " " + ex.Source; }
            if (ex.StackTrace != null) { msj = msj + " " + ex.StackTrace; }
            if (ex.TargetSite != null)
            {
                msj = msj + " " + ex.TargetSite.Name;
                foreach (System.Reflection.ParameterInfo param in ex.TargetSite.GetParameters())
                {
                    msj = msj + " " + param.Name + " = " + param.DefaultValue.ToString();
                }
            }

            msj = msj.Trim();

            Log.EscribeLog(msj, true);
        }
        public static void EliminaArchivosAntiguos()
        {
            long lDiferencia;
            FileInfo fInfoArchivo = null;
            string sRutaContenedora = string.Empty;
            DateTime dCreacion, dModificacion, dHoy;
            TimeSpan tsControlTiempo = new TimeSpan();

            try
            {
                if (_sRuta != string.Empty)
                {
                    dModificacion = DateTime.Now;
                    dCreacion = DateTime.Now;
                    dHoy = DateTime.Now;
                    lDiferencia = 0;

                    if (File.Exists(_sRuta))
                    {
                        fInfoArchivo = new FileInfo(_sRuta);
                        sRutaContenedora = fInfoArchivo.DirectoryName;

                        dCreacion = fInfoArchivo.CreationTimeUtc;
                        dModificacion = fInfoArchivo.LastWriteTimeUtc;

                        tsControlTiempo = dHoy - dModificacion;
                        lDiferencia = tsControlTiempo.Days;

                        if (Directory.Exists(sRutaContenedora))
                        {
                            if (Directory.GetFiles(sRutaContenedora).Length > 0)
                            {
                                foreach (string sFileName in Directory.GetFiles(sRutaContenedora))
                                {
                                    try
                                    {
                                        if (File.Exists(sFileName))
                                        {
                                            fInfoArchivo = new FileInfo(_sRuta);
                                            sRutaContenedora = fInfoArchivo.DirectoryName;

                                            dHoy = DateTime.Now;
                                            dCreacion = fInfoArchivo.CreationTimeUtc;
                                            dModificacion = fInfoArchivo.LastWriteTimeUtc;

                                            tsControlTiempo = DateTime.Now - dModificacion;
                                            lDiferencia = tsControlTiempo.Days;

                                            if (lDiferencia > 30)
                                            {
                                                File.Delete(sFileName);
                                                EscribeLog(string.Format("+ * _ * + Se eliminó el archivo {0} como parte del mantenimiento al repositorio de archivos. + * _ * +"));
                                            }
                                        }
                                    }
                                    catch
                                    { }
                                }
                            }
                        }
                    }
                }
            }
            catch
            { }
        }
        public static void EliminaLOGantiguo(string sRuta)
        {
            FileInfo fi = null;
            try
            {
                if (Directory.Exists(sRuta))
                {
                    foreach (string sNombreArchivo in Directory.GetFiles(sRuta))
                    {
                        if (sNombreArchivo.ToLower().Trim().EndsWith(".log") && !sNombreArchivo.Contains(DateTime.Now.Day.ToString()))
                        {
                            fi = new FileInfo(sNombreArchivo);
                            if (fi.CreationTimeUtc < DateTime.Now.AddDays(-100))
                            {
                                File.Delete(sNombreArchivo);
                                EscribeLog(string.Format("Como parte del mantenimiento del Repositorio de archivos, se eliminó el archivo '{0}'.", sNombreArchivo));
                            }
                        }
                    }
                }
            }
            catch
            { }
        }
    }
}
