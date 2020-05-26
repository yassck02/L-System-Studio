// Posted by zavax.wordpress.com
#target illustrator
 
// Constant
i2p = 72;   // inch to pt
 
// Preset
var doc_preset = new DocumentPreset;
doc_preset.units = RulerUnits.Inches;
 
// Create a new blank illustrator document and setup
var new_doc = app.documents.addDocument(DocumentColorSpace.RGB, doc_preset);
new_doc.defaultStroked = true;
new_doc.defaultStrokeWidth = 0.005;
var stroke_color = new RGBColor();
stroke_color.red = 255;
stroke_color.green = 0;
stroke_color.blue = 0;
new_doc.defaultStrokeColor = stroke_color;
new_doc.defaultFilled = false;
 
// Create a new layer
var new_layer = new_doc.layers.add();
 
// Replace the following sample odes with yours



//***************
var str = "+-+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+,F+-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-+F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+,-F-+-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-+,F+-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-+,-F-+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+,F+-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-+F+-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+,-F-+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,F+-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-F-+RF-LFL-FR+,F+-LF+RFR+FL-F-LF+RFR+FL-+F+RF-LFL-FR+,-+F+-LF+RFR+FL-F-+RF-LFL-FR+,F+RF-LFL-FR+,-F-LF+RFR+FL-+,-+,-+,";

var stringLength = str.length;
var vertex = new Array(stringLength);

var xpos = 0;
var ypos = 0;

var currentAngle = 0;

var leftAngle = 90;
var rightAngle = 90;
var lineLength = 190;

var pointCounter = 0;

for (var i = 0; i < stringLength; i++) {

	var x = str[i];

	switch(x) {
		case 'F':
			//move forward and draw a line
			xpos += Math.cos(currentAngle * 3.14159 / 180.0) * lineLength;
			ypos += Math.sin(currentAngle * 3.14159 / 180.0) * lineLength;

			vertex[pointCounter] = new Array(xpos, ypos);
			pointCounter++;
			break;

		case '+':
			//rotate left
			currentAngle -= leftAngle;
			break;
				
		case '-':
			//rotate right
			currentAngle += rightAngle;
			break;

		default:
			break;
	}

}

//***************
 
// Finally, draw the path
var new_path = new_layer.pathItems.add();

if( vertex.length > 1000 )
{
    for(i=0; i<vertex.length;i++)
    {
        pathPoint = new_path.pathPoints.add();
        pathPoint.leftDirection = vertex[i];
        pathPoint.anchor = vertex[i];
        pathPoint.rightDirection = vertex[i];
    }
}
else
{
    new_path.setEntirePath(vertex);
}