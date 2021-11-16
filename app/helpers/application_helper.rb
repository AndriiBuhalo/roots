module ApplicationHelper
<<<<<<< HEAD
  def bootstrap_class_for(name)
    { success:"alert-success",
      error:  "alert-danger",
      danger: "alert-danger",
      alert:  "alert-warning",
      notice: "alert-info"
    }[name.to_sym] || name
  end
=======
    def bootstrap_class_for(name)
     { success:"alert-success",
       error:  "alert-danger",
       danger: "alert-danger",
       alert:  "alert-warning",
       notice: "alert-info"
     }[name.to_sym] || name
   end
>>>>>>> d640d8316c98cf8085ffd419084be1a749e1016e
end
