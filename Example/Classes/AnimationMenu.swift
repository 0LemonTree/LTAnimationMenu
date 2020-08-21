//
//  AnimationMenu.swift
//  LTAimationMenu_Example
//
//  Created by 岳天爱 on 2020/8/21.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

protocol AnimationMenuDelegate:NSObjectProtocol {
    
    func bagMenuToolClicked()
    func bagMenuPlantClicked()
}

class AnimationMenu: UIView {

    let bagBtn = UIButton(type: .custom)
    var toolsBtn : UIButton!
    var plantBtn : UIButton!
    let leftLine = UIView()
    let rightLine = UIView()
    
    weak var delegate:AnimationMenuDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        config()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - - - config
    
    func config() {
        
        backgroundColor = .clear
    }
    
//    MARK: - - - layout
    
    func layout() {
              
        self.layer.cornerRadius = 22
        
        bagBtn.setImage(UIImage(named: "icon_bag_44x62_"), for: .normal)
        bagBtn.addTarget(self, action: #selector(bagAction), for: .touchUpInside)
        bagBtn.isSelected = false
        
        toolsBtn = locBtn(imageName: "icon_tools_25x24_", title: "道具")
        
        plantBtn = locBtn(imageName: "icon_plant_25x24_", title: "种苗")
        
        leftLine.isHidden = true
        leftLine.backgroundColor = UIColor(hexString: "#FFFFFF").withAlphaComponent(0.2)
        
        rightLine.isHidden = true
        rightLine.backgroundColor = UIColor(hexString: "#FFFFFF").withAlphaComponent(0.2)
        
        addSubview(leftLine)
        addSubview(rightLine)
        addSubview(toolsBtn)
        addSubview(plantBtn)
        addSubview(bagBtn)
        
        bagBtn.snp.makeConstraints { (make) in
            
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 44, height: 62))
            make.right.equalTo(-3)
        }
        
        toolsBtn.snp.makeConstraints { (make) in
            
            make.left.equalTo(20)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(44)
        }
        
        plantBtn.snp.makeConstraints { (make) in
            
            make.top.bottom.equalToSuperview()
            make.width.equalTo(toolsBtn)
            make.left.equalTo(75)
        }
        
        leftLine.snp.makeConstraints { (make) in
            
            make.centerY.equalToSuperview()
            make.height.equalTo(14)
            make.width.equalTo(1)
            make.left.equalTo(69)
        }
        
        rightLine.snp.makeConstraints { (make) in
            
            make.centerY.equalToSuperview()
            make.size.equalTo(leftLine)
            make.left.equalTo(125)
        }
    }
    
//    MARK: - - - methods
    
    @objc func bagAction() {
        
        bagBtn.isSelected = !bagBtn.isSelected

        if bagBtn.isSelected {
            
            openAction()
        } else {
            
            closeAction()
        }
        
        print(bagBtn.isSelected)
    }
    
    @objc func toolsAction() {
        
        delegate?.bagMenuToolClicked()
    }
    
    @objc func plantAction() {
        
        delegate?.bagMenuPlantClicked()
    }
    
    func locBtn(imageName:String, title:String) -> UIButton {
        
        let btn = UIButton(type: .custom)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(toolsAction), for: .touchUpInside)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setTitle(title, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: -5, left: 10, bottom: 5, right: -10)
        btn.titleEdgeInsets = UIEdgeInsets(top: 15, left: -23, bottom: -15, right: 0)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setTitleColor(UIColor(hexString: "#A3B49C"), for: .normal)
        return btn
    }
    
    func openAction() {
        
        
        UIView.animate(withDuration: 0.5, animations: {
                    
            self.bagBtn.alpha = 0
        }) { (isFinish) in
                  
            self.bagBtn.setImage(UIImage(named: "icon_noteBook_36x36_"), for: .normal)
            self.backgroundColor = UIColor(hexString: "#000000", alpha: 0.5)
            self.clipsToBounds = true
            self.plantBtn.isHidden = false
            self.toolsBtn.isHidden = false
            self.leftLine.isHidden = false
            self.rightLine.isHidden = false
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.bagBtn.alpha = 1
            }) { (isFinish) in
                
            }
        }
        
        self.snp.updateConstraints { (make) in
                                  
            make.width.equalTo(180)
        }
    }
    
    func closeAction() {
       
        self.clipsToBounds = false
             
        UIView.animate(withDuration: 0.5, animations: {
                
            self.plantBtn.isHidden = true
            self.toolsBtn.isHidden = true
            self.leftLine.isHidden = true
            self.rightLine.isHidden = true
            
            self.backgroundColor = .clear
            self.bagBtn.alpha = 0
        }) { (isFinish) in
                        
            self.bagBtn.setImage(UIImage(named: "icon_bag_44x62_"), for: .normal)
            
            UIView.animate(withDuration: 0.5, animations: {
                      
                self.bagBtn.alpha = 1
            }) { (isFinish) in
                      
            }
        }
       
        self.snp.updateConstraints { (make) in
                    
            make.width.equalTo(44)
        }
    }
    
}
