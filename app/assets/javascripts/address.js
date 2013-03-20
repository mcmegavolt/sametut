jQuery(function() {
  return $("#city_name_token").tokenInput("/schools.json", {
    theme: "",
    preventDuplicates: false,
    minChars: 3,
    tokenLimit: 1,
    noResultsText: "Населений пункт не знайдено",
    hintText: "Почніть уводити назву",
    searchingText: "Шукаємо...",
    deleteText: "<i class='icon-remove';></i>",
    prePopulate: $("#city_name_token").data("pre"),
    propertyToSearch: "name",
    resultsFormatter: function(item) {
      return "<li>" + item.name + " (" + item.region.name + ")</li>";
    },
    tokenFormatter: function(item) {
      return "<li>" + item.name + " (" + item.region.name + ")</li>";
    }
  });
});
