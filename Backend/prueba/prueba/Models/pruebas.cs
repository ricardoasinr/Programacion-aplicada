using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace prueba.Models
{
    public class pruebas
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int pruebaId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} es requerido")]

        [StringLength(200, MinimumLength = 10, ErrorMessage = "La longitud de {0} debe ser mayor a 10")]
        public string name { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} es requerido")]
        [StringLength(200, MinimumLength = 10, ErrorMessage = "La longitud de {0} debe ser mayor a 10")]
        public string description { get; set; }

    }
}
