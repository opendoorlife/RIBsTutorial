//
//  RIBs+Extension.swift
//  TicTacToe
//
//  Created by 정연문 on 2022/01/14.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs

extension ViewControllable {
  func present(viewControllable: ViewControllable, animated: Bool, completion: (() -> Void)? = nil) {
    viewControllable.uiviewController.modalPresentationStyle = .fullScreen
    uiviewController.present(viewControllable.uiviewController, animated: animated, completion: completion)
  }
  
  func pushViewController(_ viewControllable: ViewControllable, animated: Bool) {
    if let navigationController = uiviewController as? UINavigationController {
      navigationController.pushViewController(viewControllable.uiviewController, animated: animated)
    } else {
      uiviewController.navigationController?.pushViewController(viewControllable.uiviewController, animated: animated)
    }
  }
}
