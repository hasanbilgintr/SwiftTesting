/*
 Test
 -Unit Tests en büyük kısım // değişken sonuçları fonksiyon sonuçları
 -Integration Tests //Componenten aldığı sonuçlar view modelden aldığı sonuçlarvs..
 -UI Testss // buton koyduk butona tıklanıyomu o buton ekranı açıyorum  kullanıcının gördüğü viewlerin sonuçlarını kasteder
 -proje için storyboard ve include Tests işaretledik sonradanda eklenebilir ama uğraştırır. Bölyle açılınca 2 tane daha modül eklenir
 */

//nNavigation Controller konulan ViewControllerın bar alanına bar button item ile buton konabilir ve bar button itemin sağ özelliklerinden(show the attributes inspector) system itemden add konarak + olmasını sağladık
import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var toDoList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func addClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Add İtem", message: "Enter Your To Do İtem", preferredStyle: .alert)
        //alert içine TextField açıyoruz
        alert.addTextField{ TextField in
            TextField.placeholder = "Enter İtem"
        }
        
        //ok butonuna basılınca çalışna kod oldu
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            //alert içinde TextField kaçıncı sırada tanımlı ise onu alıyoruz 1 tane var zaten 0 la alıyoruz alert.textFields?[0] diye
            //textField1.text ise 1.textField i almış olıuruz
            //inputText.text boş değil demek zaten else olduğu boştur anlamına gelir returnla direk keser
            guard let textField1 = alert.textFields?[0],let inputText = textField1.text , !inputText.isEmpty else {
                return
            }
            //append en sona ekler
            //insert ise en başa ekler aslında 0 da ilk sıra kastediyoruz
            //diziye eklemiş olduk
            self.toDoList.insert(inputText, at: 0)
            //tableview eklemiş olduk
            //indexpath olmadığı için .init girdik satır0 seçerek ilk demiş olduk
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
        }
        alert.addAction(okButton)
        
        self.present(alert, animated: true)
    }
    
   
    //sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    //table view satırı işlemleri
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    //silinme için
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at:[indexPath], with: .automatic)
        }
    }
    
    
    
    
}

