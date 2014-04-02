var bitmaps = [];

/**
 * Global window onload handler
 */
function onloadHandler()
{
   // get the images loading
   bitmaps.push(new Image());
   var loader = new Preloader();
   loader.addImage(bitmaps[0], 'http://www.kevs3d.co.uk/dev/canvask3d/images/texture4.png');
   
   // start the demos once all images have been loaded
   loader.onLoadCallback(init);
}

function init()
{
   // canvas demo areas
   var canvas2 = document.getElementById('canvas2');
   
   var k3dmain2 = new K3D.RequestAnimController(canvas2);
   k3dmain2.clearingStrategy = "eachobject";
   
   
   // generate test objects
   
   
   // distribute points on the surface of a sphere in a spiral
   var N = 400;
   var R = 400;
   var pts = [];
   var k = 0;
   while (k < N) {
        var x = Math.random()*R*2 - R;
        var y = Math.random()*R*2 - R;
        var z = Math.random()*R*2 - R;
        var l = Math.sqrt(x*x + y*y + z*z)
        if (l > R) {
            continue;
        }
        pts.push({
            x: x, 
            y: y, 
            z: z
        });
        k++;
   }
   
   // points spiral sphere
   var obj1 = new K3D.K3DObject();
   with (obj1) {
      addgamma  = 1.0; 
      addtheta  = 1.0; 
      addphi    = -0.5;
      linescale = 4.0;
   }
   obj1.init(pts, [], []);
   k3dmain2.addK3DObject(obj1);
   
   // render first frames
   // use motion blur background fill
   k3dmain2.fillStyle = "rgba(0,0,0, 1)";
   k3dmain2.frame();
}

