using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ayudantia28WebApp.Models
{
    public enum SexType

    {

        Hombre = 0,
        Mujer = 1,

    }
    public class People
    {
        [Key]

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int personId { get; set; }



        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} es requerido")]

        [StringLength(200, MinimumLength = 5, ErrorMessage = "La longitud de {0} debe ser mayor a 5")]

        [Display(Name = "Nombre")]
        public string? nombre { get; set; }



        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} es requerido")]
        [StringLength(200, MinimumLength = 10, ErrorMessage = "La longitud de {0} debe ser mayor a 10")]
        [Display(Name = "Carrera")]
        public string? carrera { get; set; }

        [Display(Name = "Generoo")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} es requerido")]
        public SexType sextype { get; set; }
    }
}
