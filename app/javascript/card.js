  const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("transaction-form-wrap");
  console.log(form)
  form.addEventListener("submit", (e) => {
    console.log("ok")
    e.preventDefault();

    const formResult = document.getElementById("transaction-form-wrap");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("card_number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("transaction-form-wrap");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("transaction-form-wrap").submit();

    });

  });
};

window.addEventListener("load", pay);


