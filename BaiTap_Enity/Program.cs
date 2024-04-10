using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BaiTap_Enity
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            using (var db = new ThanhGiang_BaiTap_EFEntities())
            {
                var list = db.Students.Join(db.Faculties,
                                         s => s.FacultyId, f => f.FacultyId,
                                         (s, f) => new { s, f });
                Console.WriteLine("Danh Sach Sinh Vien");
                foreach (var item in list)
                {
                    Console.WriteLine($"Msv: {item.s.StudentId} - Ho ten: {item.s.StudentName} - Ngay sinh: {item.s.Gender} - Dia chi: {item.s.Address} - Khoa: {item.f.FacultyName}");
                }
                Console.WriteLine("\nDanh sach sinh vien khoa CNS do tuoi tu 18 den 20");
                var select = list.Where(l => l.f.FacultyName.Equals("Công Nghệ Số") && (DateTime.Today.Year - l.s.Gender.Value.Year > 18) && (DateTime.Today.Year - l.s.Gender.Value.Year <20));
                foreach (var item in select)
                {
                    Console.WriteLine($"Msv: {item.s.StudentId} - Ho ten: {item.s.StudentName} - Ngay sinh: {item.s.Gender} - Dia chi: {item.s.Address} - Khoa: {item.f.FacultyName}");
                }
            }

            Console.ReadLine();
        }
    }
}
