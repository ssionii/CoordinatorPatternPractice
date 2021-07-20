//
//  Coordinator.swift
//  RayPets
//
//  Created by  60117280 on 2021/07/19.
//

import UIKit

public protocol Coordinator: class {
    
    var children: [Coordinator] { get set }
    var router: Router { get }
    
    func present(animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
    func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)?)
}

extension Coordinator {
    
    // 본인 닫기 ?
    public func dismiss(animated: Bool) {
        router.dismiss(animated: animated)
    }
    
    // 자식 띄우기
    public func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)? = nil) {
        children.append(child)
        child.present(animated: animated, onDismissed: { [ weak self, weak child] in
            guard let self = self,
                  let child = child else {
                return
            }
            self.removeChild(child)
            onDismissed?()
        })
    }
    
    // children에서 child 삭제
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
    }
}
