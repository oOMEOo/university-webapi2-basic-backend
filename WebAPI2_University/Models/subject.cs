namespace WebAPI2_University.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class subject
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public subject()
        {
            subject_registrations = new HashSet<subject_registration>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(6)]
        public string code { get; set; }

        [Required]
        [StringLength(250)]
        public string description { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<subject_registration> subject_registrations { get; set; }
    }
}
