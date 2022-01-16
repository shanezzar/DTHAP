//
//  DetailViewController.swift
//  DTHAP
//
//  Created by Shanezzar Sharon on 14/01/2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    // MARK:- variables
    let gifImageView = SDAnimatedImageView()
    let idValueLabel = UILabel()
    let tldValueLabel = UILabel()
    let titleValueLabel = UILabel()
    let byValueLabel = UILabel()
    let ratingValueLabel = UILabel()
    
    var id: String = ""
    
    let model = NetworkModel()
    
    
    // MARK:- functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "arrow"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTaped(_:)), for: .touchUpInside)
        view.addSubview(backButton)
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Details"
        titleLabel.textColor = UIColor.titleColor
        titleLabel.font = UIFont.init(name: CustomFont.sofiaProSemiBold, size: 23)
        view.addSubview(titleLabel)
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(myView)
        
        gifImageView.translatesAutoresizingMaskIntoConstraints = false
        gifImageView.layer.masksToBounds = true
        gifImageView.sd_imageIndicator = SDWebImageActivityIndicator.large
        gifImageView.contentMode = .scaleAspectFill
        gifImageView.layer.cornerRadius = 8
        myView.addSubview(gifImageView)
        
        let idLabel = UILabel()
        idLabel.text = "Id:"
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.textColor = UIColor.titleColor
        idLabel.font = UIFont.init(name: CustomFont.sofiaProSemiBold, size: 16)
        idLabel.numberOfLines = 0
        
        idValueLabel.translatesAutoresizingMaskIntoConstraints = false
        idValueLabel.textColor = UIColor.bodyColor
        idValueLabel.font = UIFont.init(name: CustomFont.sofiaProLight, size: 14)
        idValueLabel.numberOfLines = 0
        
        let idHorizontalStackView = UIStackView()
        idHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        idHorizontalStackView.axis = .horizontal
        idHorizontalStackView.spacing = 16
        idHorizontalStackView.addArrangedSubview(idLabel)
        idHorizontalStackView.addArrangedSubview(idValueLabel)
        
        let tldLabel = UILabel()
        tldLabel.text = "Tld:"
        tldLabel.translatesAutoresizingMaskIntoConstraints = false
        tldLabel.textColor = UIColor.titleColor
        tldLabel.font = UIFont.init(name: CustomFont.sofiaProSemiBold, size: 16)
        tldLabel.numberOfLines = 0
        
        tldValueLabel.translatesAutoresizingMaskIntoConstraints = false
        tldValueLabel.textColor = UIColor.bodyColor
        tldValueLabel.font = UIFont.init(name: CustomFont.sofiaProLight, size: 14)
        tldValueLabel.numberOfLines = 0
        
        let tldHorizontalStackView = UIStackView()
        tldHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        tldHorizontalStackView.axis = .horizontal
        tldHorizontalStackView.spacing = 16
        tldHorizontalStackView.addArrangedSubview(tldLabel)
        tldHorizontalStackView.addArrangedSubview(tldValueLabel)
        
        let titleTitleLabel = UILabel()
        titleTitleLabel.text = "Title:"
        titleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTitleLabel.textColor = UIColor.titleColor
        titleTitleLabel.font = UIFont.init(name: CustomFont.sofiaProSemiBold, size: 16)
        titleTitleLabel.numberOfLines = 0
        
        titleValueLabel.translatesAutoresizingMaskIntoConstraints = false
        titleValueLabel.textColor = UIColor.bodyColor
        titleValueLabel.font = UIFont.init(name: CustomFont.sofiaProLight, size: 14)
        titleValueLabel.numberOfLines = 0
        
        let titleHorizontalStackView = UIStackView()
        titleHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        titleHorizontalStackView.axis = .horizontal
        titleHorizontalStackView.spacing = 16
        titleHorizontalStackView.addArrangedSubview(titleTitleLabel)
        titleHorizontalStackView.addArrangedSubview(titleValueLabel)
    
        let byLabel = UILabel()
        byLabel.text = "By:"
        byLabel.translatesAutoresizingMaskIntoConstraints = false
        byLabel.textColor = UIColor.titleColor
        byLabel.font = UIFont.init(name: CustomFont.sofiaProSemiBold, size: 16)
        byLabel.numberOfLines = 0
        
        byValueLabel.translatesAutoresizingMaskIntoConstraints = false
        byValueLabel.textColor = UIColor.bodyColor
        byValueLabel.font = UIFont.init(name: CustomFont.sofiaProLight, size: 14)
        byValueLabel.numberOfLines = 0
        
        let byHorizontalStackView = UIStackView()
        byHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        byHorizontalStackView.axis = .horizontal
        byHorizontalStackView.spacing = 16
        byHorizontalStackView.addArrangedSubview(byLabel)
        byHorizontalStackView.addArrangedSubview(byValueLabel)
        
        let ratingLabel = UILabel()
        ratingLabel.text = "Rating:"
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.textColor = UIColor.titleColor
        ratingLabel.font = UIFont.init(name: CustomFont.sofiaProSemiBold, size: 16)
        ratingLabel.numberOfLines = 0
        
        ratingValueLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingValueLabel.textColor = UIColor.bodyColor
        ratingValueLabel.font = UIFont.init(name: CustomFont.sofiaProLight, size: 14)
        ratingValueLabel.numberOfLines = 0
        
        let ratingHorizontalStackView = UIStackView()
        ratingHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        ratingHorizontalStackView.axis = .horizontal
        ratingHorizontalStackView.spacing = 16
        ratingHorizontalStackView.addArrangedSubview(ratingLabel)
        ratingHorizontalStackView.addArrangedSubview(ratingValueLabel)
        
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 16
        verticalStackView.addArrangedSubview(idHorizontalStackView)
        verticalStackView.addArrangedSubview(tldHorizontalStackView)
        verticalStackView.addArrangedSubview(titleHorizontalStackView)
        verticalStackView.addArrangedSubview(byHorizontalStackView)
        verticalStackView.addArrangedSubview(ratingHorizontalStackView)
        myView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            myView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            myView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            myView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            myView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            myView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            gifImageView.heightAnchor.constraint(equalToConstant: 240),
            gifImageView.topAnchor.constraint(equalTo: myView.topAnchor, constant: 24),
            gifImageView.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 24),
            gifImageView.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -24),
            
            idLabel.widthAnchor.constraint(equalToConstant: 60),
            tldLabel.widthAnchor.constraint(equalToConstant: 60),
            titleTitleLabel.widthAnchor.constraint(equalToConstant: 60),
            byLabel.widthAnchor.constraint(equalToConstant: 60),
            ratingLabel.widthAnchor.constraint(equalToConstant: 60),
            
            verticalStackView.topAnchor.constraint(equalTo: gifImageView.bottomAnchor, constant: 24),
            verticalStackView.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 24),
            verticalStackView.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -24),
            verticalStackView.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -36)
        ])
        
    }
    
    func setup() {
        model.fetchGIF(id) { gif, error in
            if let error = error {
                let alert = UIAlertController(title: "Ops!", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard let gif = gif else { return }
            
            DispatchQueue.main.async {
                self.gifImageView.sd_setImage(with: URL(string: gif.image.downsizedMedium.url))
                self.idValueLabel.text = gif.id.isEmpty ? "..." : gif.id
                self.tldValueLabel.text = gif.tld.isEmpty ? "..." : gif.tld
                self.titleValueLabel.text = gif.title.isEmpty ? "..." : gif.title
                self.byValueLabel.text = gif.username.isEmpty ? "..." : gif.username
                self.ratingValueLabel.text = gif.rating.isEmpty ? "..." : gif.rating
            }
        }
        
    }
    
    @objc func backButtonTaped(_ sender: UIButton){
        haptic()
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
