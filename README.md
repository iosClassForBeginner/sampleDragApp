 
# 第11回: １時間でiPhoneアプリを作ろう

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleDragApp/blob/master/Assets/sample.gif" /></div>
  
  当アカウントへ訪れていただき、誠にありがとうございます。第11回アプリ教室では、画像ドラッグアプリを作ります。自分のペースで勉強したい、勉強前に予習したい、内容を復習したい場合、ご利用ください。
  
## アプリ教室に興味ある方、歓迎します。  
  Meetup  
  http://www.meetup.com/ios-dev-in-namba/
  
## 別途アプリ教室(有料)も開いております  
  http://learning-ios-dev.esy.es/  

## 問い合わせ
  株式会社ジーライブ
  http://geelive-inc.com  

## アプリ作成手順

#### 0, アプリ開発準備
> 0-1. 表示する写真、アイコンの準備
  ・アイコン
    http://flat-icon-design.com/

> 0-2. Auto Layout, Size ClassesをOFFにします
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleDragApp/blob/master/Assets/0.gif" /></div>

#### 1, Storyboardで、アプリのデザイン
> 1-1. ダウンロードした画像をxcode内へドラッグ&ドロップします。
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleDragApp/blob/master/Assets/1.gif" /></div>

> 1-2. main.storyboardを選択し、UI部品からUIImageViewを配置します。(ドラッグ&ドロップ)
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleDragApp/blob/master/Assets/2.gif" /></div>

> 1-3. UIImageViewの画像を選択します。
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleDragApp/blob/master/Assets/3.gif" /></div>

> 1-2. StoryboardのUIImageViewを、ViewController.swiftに紐づけます
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleDragApp/blob/master/Assets/4.gif" /></div>

#### 2, ViewController.swiftにコード記述
- 以下コードブロックを記入
  
```Swift

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 画面タッチ開始
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("Touch Start")
        
    }
    
    //　ドラッグ時に呼ばれる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチイベント取得
        let touch = touches.first!
        
        // ドラッグ前の位置
        let beforeX = touch.previousLocation(in: self.view).x
        let beforeY = touch.previousLocation(in: self.view).y
        
        // ドラッグ後の位置
        let afterX = touch.location(in: self.view).x
        let afterY = touch.location(in: self.view).y
        
        // ドラッグしたx座標の移動距離
        let farX = afterX - beforeX
        
        // ドラッグしたy座標の移動距離
        let farY = afterY - beforeY
        
        // 画像の座標取得
        var viewFrame = myImageView.frame
        
        // 移動分を反映させる
        viewFrame.origin.x += farX
        viewFrame.origin.y += farY
        
        myImageView.frame = viewFrame
    }
    
    // 画面タッチ終了
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("Touch End")
    }


}
```
