
document.addEventListener('DOMContentLoaded', function(){

  let input = document.getElementById('input');
  const log = document.getElementById('item-price');

  log.addEventListener('keyup', function(){
    // console.log(price);

    this.setAttribute("price", "price-input")
    const price = log.value;
    console.log(price);
    const commission = price*0.1;
    console.log(commission);
    const total_price = price - commission;
    console.log(total_price);

    document.getElementById('add-tax-price').innerHTML = commission;
    document.getElementById('profit').innerHTML = total_price;
  })
})


