using System.ComponentModel.DataAnnotations;

namespace PersonAPI.Models
{
    public enum SexType
    {
        Hombre = 0,
        Mujer = 1,
    }

    public class People
    {
        [Key]
        public int PersonId { get; set; }

        [Required(ErrorMessage = "El nombre de la persona es requerido")]
        [StringLength(60, MinimumLength = 3, ErrorMessage = "El nombre debe tener al menos de 3 letras")]
        [Display(Name = "Nombre")]
        public string nombre { get; set; }

        [Required(ErrorMessage = "La edad es un campo requerido")]
        [Display(Name = "Edad")]
        public int edad { get; set; }

        [Required(ErrorMessage = "Este campo es requerido")]
        [Display(Name = "Género")]
        public SexType sex { get; set; }

    }
}
