function calc_price() {
const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const  sellProfit = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    sellProfit.innerHTML = inputValue - Math.floor(inputValue * 0.1)
 });
};

 window.addEventListener('turbo:load', calc_price);