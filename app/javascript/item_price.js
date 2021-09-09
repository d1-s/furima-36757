function commission(){
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const tax = document.getElementById('add-tax-price');
    tax.innerHTML = Math.ceil(inputValue * 0.1);
    const profit = document.getElementById('profit')
    profit.innerHTML = Math.floor(inputValue * 0.9);
  });
};

window.addEventListener('load', commission)