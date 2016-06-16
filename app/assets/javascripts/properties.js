$(document).ready(function () {
  var $properties = $('.property');

  $("#property_filter_category").on("change", function () {
    var currentCategory = this.value;
    $properties.each(function (index, property) {
    var $property = $(property);
      if($property.data("category") === currentCategory) {
        $property.show();
      } else {
        $property.hide();
      }
    });
  });


  $("#property_filter_name").on('keyup', function(){
  var currentTitle = this.value;
  $properties.each(function (index, property) {
    console.log(property);
    console.log(index);
    var $property = $(property);
    if($property.data("title").indexOf(currentTitle) !== -1 ){
      $property.show();
    } else {
      $property.hide();
    }
  });
});


  $("#property_filter_city").on("change", function () {
    var currentCity = this.value;
    $properties.each(function (index, property) {
    var $property = $(property);
      if($property.data("city") === currentCity) {
        $property.show();
      } else {
        $property.hide();
      }
    });
  });
});
