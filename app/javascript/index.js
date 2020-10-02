
document.addEventListener('DOMContentLoaded', function(){

  let input = document.getElementById('input');
  const log = document.getElementById('item-price');

  log.addEventListener('keyup', function(){
    this.setAttribute("price", "price-input")
    const price = log.value;
    const commission = price*0.1;
    const total_price = price - commission;

    document.getElementById('add-tax-price').innerHTML = commission;
    document.getElementById('profit').innerHTML = total_price;
  })
})


