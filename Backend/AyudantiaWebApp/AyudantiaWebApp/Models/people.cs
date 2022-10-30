using System.ComponentModel.DataAnnotations;

namespace AyudantiaWebApp.Models
{
    public enum sexType
    {
        male = 0,
        female = 1,
    }
    public class people
    {
        [Key]
        public int personId { get; set; }

        [Required(ErrorMessage = "El nombre del cliente es requerido")]
        [StringLength(60, MinimumLength = 3, ErrorMessage = "El nombre debe tener mas de 3 letras")]
        [Display(Name = "Nombre")]
        public string name { get; set; }

        [Required(ErrorMessage = "La edad de la persona es requerido")]

        [Display(Name = "Edad")]
        public int age { get; set; }

        [Required(ErrorMessage = "Este campo es requerido")]
        [Display(Name = "Selecciona tu genero")]
        public sexType sex { get; set; }

    }
}
