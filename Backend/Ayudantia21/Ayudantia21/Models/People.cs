

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ayudantia21.Models

{

    public enum SexType
    {
        Hombre = 0,
        Mujer = 1,
        
    }

    public class People
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int personId { get; set; }


        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} es requerido")]
        [StringLength(200, MinimumLength = 5, ErrorMessage = "La longitud de {0} debe ser mayor a 5")]
        public string name { get; set; }


        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} es requerido")]
        public int age { get; set; }


        [Required(ErrorMessage = "La sexo es requerida")]
        public SexType sex { get; set; }


        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} es requerido")]
        [StringLength(200, MinimumLength = 5, ErrorMessage = "La longitud de {0} debe ser mayor a 10")]
        public string hobbie { get; set; }





    }
}
