//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Noboru Nishizawa on 2019/06/09.
//  Copyright © 2019 heuy.freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var proceed: UIButton!
    @IBOutlet weak var turnBack: UIButton!
    @IBOutlet weak var playAutomatically: UIButton!
    
    //再生ステータス
    var isPlay:Bool = false
    // タイマー
    var timer: Timer!
    //配列添え字初期化
    var imgIndex = 0
    //画像名配列
    var names = [String]()

    @IBAction func onTapImage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "ExpandImage", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のexpandImageViewControllerを取得する
        let expandImageViewController:ExpandImageViewController = segue.destination as! ExpandImageViewController
        // 遷移先のexpandImageViewControllerにデータを渡す
        expandImageViewController.imgNumber = self.imgIndex
        //AutoPlayは止める
        if isPlay {
            toggleAutoplayAndPause(self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Imagesクラスからnames配列へ代入
        let imgs = Images()
        self.names = imgs.getArray()
        showImage("init")
    }

    func showImage(_ s:String){
        imageView.image = UIImage(named: self.names[0])
    }
    //Fixme:Grobal変数imgを作り,Imagesクラスを生成し代入、
    //下記関数内で、self.img.getName(index)を使ってやる方法はうまくいかなかった。
    //debugではimage名は取れていたが、表示がうまくいかず。
    func showImage(index:Int) {
        if imageView.image != nil {
            imageView.image = UIImage(named: self.names[index])
        } else {
            imageView.image = UIImage(named: self.names[index])
        }
    }
    @objc func replaceImage(_ timer: Timer) {
        getNextPhoto(self)
    }
    
    @IBAction func getNextPhoto(_ sender: Any) {
        if self.imgIndex >= 0,self.imgIndex < self.names.count - 1 {
            self.imgIndex += 1
        } else if self.imgIndex == self.names.count - 1 {
            self.imgIndex = 0
        }
       showImage(index: self.imgIndex)
    }
    @IBAction func getPreviousPhoto(_ sender: Any) {
        if self.imgIndex > 0,self.imgIndex < names.count {
            self.imgIndex -= 1
        } else if self.imgIndex == 0 {
            self.imgIndex = 4
        }
        showImage(index: self.imgIndex)
    }
    @IBAction func toggleAutoplayAndPause(_ sender: Any) {
        if self.isPlay == false {
            self.isPlay = true
            playAutomatically.setTitle("停止", for: .normal)
            proceed.isEnabled = false
            turnBack.isEnabled = false
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(replaceImage(_:)), userInfo: nil, repeats: true)
            }
        } else {
            self.isPlay = false
            playAutomatically.setTitle("再生", for: .normal)
            proceed.isEnabled = true
            turnBack.isEnabled = true
            if self.timer != nil{
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

