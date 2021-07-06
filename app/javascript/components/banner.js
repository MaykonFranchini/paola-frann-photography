import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Pre-Wedding", "Newborn", "Pregnant"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };