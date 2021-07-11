import places from 'places.js';
// used to autocomplete address when creating a new studio
const initAutocomplete = () => {
  const addressInput = document.getElementById('studio_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };