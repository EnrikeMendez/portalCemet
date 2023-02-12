$(document).ready(function () {
    var cSelect = document.querySelectorAll("[data-choices]");
    //console.log("cSelect: ", cSelect);
    cSelect.forEach(el => {
        const t = {
            ...el.dataset.choices ? JSON.parse(el.dataset.choices) : {},
            ...{
                classNames: {
                    containerInner: el.className,
                    input: "form-control",
                    inputCloned: "form-control-sm",
                    listDropdown: "dropdown-menu",
                    itemChoice: "dropdown-item",
                    activeState: "show",
                    selectedState: "active"
                }
            }
        }
        new Choices(el, t)
    });
});