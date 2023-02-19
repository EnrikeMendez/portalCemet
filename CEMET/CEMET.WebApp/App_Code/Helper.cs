using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;

namespace CEMET.WebApp.App_Code
{
    public static class Helper
    {
        /// <summary>
        /// For read one setting
        /// </summary>
        /// <param name="key">Key correspondent a your setting</param>
        /// <returns>Return the String contains the value to setting</returns>
        public static string ReadSetting(string key)
        {
            var appSettings = ConfigurationManager.AppSettings;
            return appSettings[key] ?? string.Empty;
        }

        /// <summary>
        /// Read all settings for output Dictionary<string,string> 
        /// </summary>        
        /// <returns>Return the Dictionary<string,string> contains all settings</returns>
        public static Dictionary<string, string> ReadAllSettings()
        {
            var result = new Dictionary<string, string>();
            foreach (var key in ConfigurationManager.AppSettings.AllKeys)
                result.Add(key, ConfigurationManager.AppSettings[key]);
            return result;
        }

        /// <summary>
        /// Move all the files defined in the <paramref name="sourceFolderPath"/> to the <
        /// </summary>
        /// <param name="sourceFolderPath"></param>
        /// <param name="destinationFolderPath"></param>
        public static void MoveAllFiles(string sourceFolderPath, string destinationFolderPath)
        {
            try
            {
                var destFolder = Directory.CreateDirectory(path: destinationFolderPath);

                var sourceFiles = Directory.GetFiles(path: sourceFolderPath, searchPattern: "*.*", searchOption: SearchOption.AllDirectories);

                foreach (string file in sourceFiles)
                {
                    FileInfo mFile = new FileInfo(file);
                    // to remove name collisions
                    if (!new FileInfo(destFolder + "\\" + mFile.Name).Exists)
                    {
                        mFile.MoveTo(destFolder + "\\" + mFile.Name);
                    }
                }

                Directory.Delete(path: sourceFolderPath, recursive: true);
            }
            catch (Exception ex)
            {
                //throw ex;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="usuarioId"></param>
        /// <returns></returns>
        public static string CreateTempPath(string usuarioId)
        {
            return ReadSetting(key: "FolderTemporalDocs") + usuarioId;
        }
    }
}