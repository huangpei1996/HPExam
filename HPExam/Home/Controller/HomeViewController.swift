//
//  HomeViewController.swift
//  HPExam
//
//  Created by 雅风 on 2017/12/8.
//  Copyright © 2017年 yafeng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, SliderGalleryControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    //获取屏幕宽度
    let screenWidth =  UIScreen.main.bounds.size.width
    
    //图片轮播组件
    var sliderGallery : SliderGalleryController!
    
    //图片集合
    var images = ["https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=acf00ce8ba1bb0519024b528067bda77/0df3d7ca7bcb0a46f7988bf36263f6246a60af45.jpg",
                  "https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=acf00ce8ba1bb0519024b528067bda77/0df3d7ca7bcb0a46f7988bf36263f6246a60af45.jpg",
                  "https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=acf00ce8ba1bb0519024b528067bda77/0df3d7ca7bcb0a46f7988bf36263f6246a60af45.jpg",
                  "https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=acf00ce8ba1bb0519024b528067bda77/0df3d7ca7bcb0a46f7988bf36263f6246a60af45.jpg",
                  "https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=acf00ce8ba1bb0519024b528067bda77/0df3d7ca7bcb0a46f7988bf36263f6246a60af45.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化图片轮播组件
        sliderGallery = SliderGalleryController()
        sliderGallery.delegate = self
        sliderGallery.view.frame = CGRect(x: 0, y: 50, width: screenWidth,height: 200)
        
        //将图片轮播组件添加到当前视图
        self.addChildViewController(sliderGallery)
        self.view.addSubview(sliderGallery.view)
        
        //添加组件的点击事件
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(HomeViewController.handleTapAction(_:)))
        sliderGallery.view.addGestureRecognizer(tap)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //去除单元格分隔线
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 100;
        self.view.addSubview(tableView)
    }
    
    //图片轮播组件协议方法：获取内部scrollView尺寸
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: screenWidth, height: 200)
    }
    
    //图片轮播组件协议方法：获取数据集合
    func galleryDataSource() -> [String] {
        return images
    }
    
    //点击事件响应
    @objc func handleTapAction(_ tap:UITapGestureRecognizer)->Void{
        //获取图片索引值
        let index = sliderGallery.currentIndex
        //弹出索引信息
        let alertController = UIAlertController(title: "您点击的图片索引是：",
                                                message: "\(index)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //“刷新数据”按钮点击
    @IBAction func reloadBtnTap(_ sender: AnyObject) {
        images = ["http://tupian.enterdesk.com/2012/1015/zyz/03/5.jpg",
                  "http://img.web07.cn/UpImg/Desk/201301/12/desk230393121053551.jpg",
                  "http://bizhi.zhuoku.com/wall/jie/20061124/cartoon2/cartoon014.jpg"]
        sliderGallery.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //返回分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回单元格数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return 5
    }
    
    //返回单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //获取单元格
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath)
                as! HomeTableViewCell
            
            //设置单元格数据
            
            
            return cell
    }
}
