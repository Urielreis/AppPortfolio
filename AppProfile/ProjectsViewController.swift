//
//  ProjectsViewController.swift
//  AppProfile
//
//  Created by Uriel on 12/09/24.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    let projects = ["Projeto 1", "Projeto 2", "Projeto 3"] // Adicione mais projetos aqui
    let projectVideos = ["video1", "video2", "video3"] // Adicione os nomes dos vídeos correspondentes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground
        
        let titleLabel = UILabel()
        titleLabel.text = "Meus Projetos"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = UIColor.systemTeal
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProjectsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = projects[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        cell.textLabel?.textColor = UIColor.systemPurple
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let projectDetailVC = ProjectDetailViewController()
        projectDetailVC.projectName = projects[indexPath.row]
        projectDetailVC.videoName = projectVideos[indexPath.row]
        navigationController?.pushViewController(projectDetailVC, animated: true)
    }
}
