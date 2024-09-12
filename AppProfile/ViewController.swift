//
//  ViewController.swift
//  AppProfile
//
//  Created by Uriel on 12/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.systemTeal
        
        // Imagem circular para a foto
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "sua_foto") // Substitua pelo nome da sua imagem
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 75 // Ajuste o tamanho conforme necessário
        profileImageView.clipsToBounds = true
        
        // Título
        let titleLabel = UILabel()
        titleLabel.text = "Meu Portfólio"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        // Descrição
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Desenvolvedor iOS || Apaixonado por Tecnologia"
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        
        // Botão
        let button = UIButton(type: .system)
        button.setTitle("Ver Projetos", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.systemPurple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showProjects), for: .touchUpInside)
        
        // Adicionando subviews
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(button)
        
        // Configurando constraints
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Animação do botão
        button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.3, delay: 0.5, options: [.curveEaseInOut], animations: {
            button.transform = CGAffineTransform.identity
        })
    }
    
    @objc private func showProjects() {
        let projectsVC = ProjectsViewController()
        navigationController?.pushViewController(projectsVC, animated: true)
    }
}

