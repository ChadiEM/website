var welcomeTexts = ["Welcome","Bienvenue","Ahlan wa sahlan","Willkommen","Bienvenido","Valkommen"];

listPointer = 0;
listLength = welcomeTexts.length;

i = 0;

setInterval(
function () {
    currentHeader = $("#headercontainer").find("h1:eq(" + i + ")");
    i = (i + 1) % 2;
    nextHeader = $("#headercontainer").find("h1:eq(" + i + ")");

    // Set the current and next text to fade to
    currentHeader.html(welcomeTexts[listPointer]);
    listPointer = (listPointer + 1) % listLength;
    nextHeader.html(welcomeTexts[listPointer]);
    
    // Fade out, Fade in
    currentHeader.fadeOut(1500);
    nextHeader.fadeIn(1500);
},
4000);
