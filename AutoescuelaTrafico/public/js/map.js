var map = L.map('mapid').setView([37.3848963,-6.0114024], 17);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'}).addTo(map);

L.marker([37.384798, -6.011734]).addTo(map)
    .bindPopup('Estamos aquí')
    .openPopup();