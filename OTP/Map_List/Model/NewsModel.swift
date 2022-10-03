//
//  File.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//


import SwiftUI

struct News: Codable, Identifiable {
  let id: String
  let title: String
  let subtitle: String
  let text: String
  let link: String
  let image: String
}
