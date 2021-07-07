import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const order_date = document.getElementById('order_booking_date');
  flatpickr(order_date, {
    altInput: true
  });
}

export { initFlatpickr };