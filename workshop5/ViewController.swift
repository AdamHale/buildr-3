import UIKit
import MapKit
import CoreLocation
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var containerVC: UIView!
    
    let locationManager = CLLocationManager ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMap.setUserTrackingMode(.Follow, animated: true)
        containerVC.hidden = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self

        let pierApproach = CLLocationCoordinate2D(latitude: 50.716266, longitude: -1.875662)
        let pierApproachRegion = CLCircularRegion(center: pierApproach, radius: 20, identifier: "approach")
        locationManager.startMonitoringForRegion(pierApproachRegion)
    
        

        
        
        
    }
}

    extension ViewController: CLLocationManagerDelegate {


        
        func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
            //myImage.image = UIImage(named: region.identifier)
            print("WORKED")
            
            let alert = UIAlertController(title: "New Buildr timeline found!", message: "You've successfully found: Bournemouth Pier Approrach ", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "View", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
            alert.addAction(alertAction)
            presentViewController(alert, animated: true) { () -> Void in }
            
            containerVC.hidden = false
        
        }
        
    
        
        
        
        
        func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
            //myImage.image = nil
            
            containerVC.hidden = true
            
        }

            
}