// -------------------------------------------------------------------
// markItUp!
// -------------------------------------------------------------------
// Copyright (C) 2008 Jay Salvat
// http://markitup.jaysalvat.com/
// -------------------------------------------------------------------
// Textile tags example
// http://en.wikipedia.org/wiki/Textile_(markup_language)
// http://www.textism.com/
// -------------------------------------------------------------------
// Feel free to add more tags
// -------------------------------------------------------------------
mySettings = {
    resizeHandle: true,
    previewTemplatePath: '/javascripts/markitup/templates/preview.html',
    previewParserPath:    '/admin/textile_parser', // path to your Textile parser
    onShiftEnter:        {keepDefault:false, replaceWith:'\n\n'},
    markupSet: [
        {name:'Nadpis 1', key:'1', openWith:'h1(!(([![Class]!]))!). ', placeHolder:'Nadpis' },
        {name:'Nadpis 2', key:'2', openWith:'h2(!(([![Class]!]))!). ', placeHolder:'Nadpis' },
        {name:'Nadpis 3', key:'3', openWith:'h3(!(([![Class]!]))!). ', placeHolder:'Nadpis' },
        {name:'Nadpis 4', key:'4', openWith:'h4(!(([![Class]!]))!). ', placeHolder:'Nadpis' },
        {name:'Nadpis 5', key:'5', openWith:'h5(!(([![Class]!]))!). ', placeHolder:'Nadpis' },
        {name:'Nadpis 6', key:'6', openWith:'h6(!(([![Class]!]))!). ', placeHolder:'Nadpis' },
        {name:'Odstavec', key:'P', openWith:'p(!(([![Class]!]))!). '},
        {separator:'---------------' },
        {name:'Tučné', key:'B', closeWith:'*', openWith:'*'},
        {name:'Kurzíva', key:'I', closeWith:'_', openWith:'_'},
        {name:'Škrtnuté', key:'S', closeWith:'-', openWith:'-'},
        {separator:'---------------' },
        {name:'Odrážkový seznam', openWith:'(!(* |!|*)!)'},
        {name:'Číselný seznam', openWith:'(!(# |!|#)!)'},
        {separator:'---------------' },
        {name:'Obrázek', replaceWith:'![![URL obrázku:!:http://]!]([![Popisek (alternativní text)]!])!'},
        //{name:'Obrázek s galerií', replaceWith:'\nfig. [![Náhled URL:!:http://]!] | [![Skutečná velikost URL:!:http://]!] | [![Popisek]!] \n'},
        //{name:'Ikonka',replaceWith:'\nicon. [![URL ikonky:]!] | [![URL cíle:]!] | [![Text:]!] \n'},
        //{name:'Google mapa', replaceWith:'\ngmap. [![Latitude (např. 50.045542):]!] | [![Longitude (např. 14.446846):]!] | [![Zoom (např. 10):]!] | [![Popisek]!] \n'},
        //{name:'Youtube video', replaceWith:'\nyoutube. [![Kód (např. QKPwuJyC-4E):]!] | [![Šířka v pixelech:]!] | [![Výška v pixelech:]!] | [![Popisek]!] \n'},
        //{name:'Flash', replaceWith:'\nflash. [![URL flashe:]!] | [![Šířka v pixelech:]!] | [![Výška v pixelech:]!] \n'},
        {separator:'---------------' },
        {name:'Odkaz', openWith:'"', closeWith:'([![Popisek]!])":[![URL:!:http://]!]', placeHolder:'Text odkazu' },
        {separator:'---------------' },
        {name:'Citace', openWith:'bq(!(([![Třída]!]))!). '},
        {name:'Kód', openWith:'@', closeWith:'@'},
        {separator:'---------------' },
        {name:'Náhled', call:'preview', className:'preview'}
    ]
};