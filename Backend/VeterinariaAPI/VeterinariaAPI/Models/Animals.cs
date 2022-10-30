using System.ComponentModel.DataAnnotations;

namespace VeterinariaAPI.Models
{
    public enum AnimalType
    {
        Perro = 0,
        Gato = 1,
        Hamster = 2,
        Tortuga = 3
    }
    public class Animals
    {
        [Key]
        public int AnimalId { get; set; }


        [Required(ErrorMessage = "El nombre del animal es requerido")]
        [StringLength(60, MinimumLength = 3, ErrorMessage = "El nombre debe tener mas de 3 letras")]
        [Display(Name = "Nombre del animal")]
        public string nameAnimal { get; set; }

        [Required(ErrorMessage = "La raza del animal es requerida")]

        [Display(Name = "Raza")]
        public string raza { get; set; }

        [Required(ErrorMessage = "La mascota es requerida")]
        [Display(Name = "Escoge tu mascota")]
        public AnimalType type  { get; set; }


    }
}
