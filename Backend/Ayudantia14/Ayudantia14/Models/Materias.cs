using System.ComponentModel.DataAnnotations;

namespace Ayudantia14.Models
{
    public class Materias
    {
        [Key]
        public int materiaId { get; set; }

        public string nombreMateria { get; set; }

        public string sigla { get; set; }

        public string nombreDocente { get; set; }



    }
}
