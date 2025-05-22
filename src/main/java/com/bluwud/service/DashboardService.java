package com.bluwud.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.Map;
import java.util.HashMap;

import com.bluwud.config.DbConfig;

public class DashboardService {

	public int getTotalUsers() {
		String query = "SELECT COUNT(*) FROM users";
		try (Connection conn = DbConfig.getDbConnection();
				PreparedStatement stmt = conn.prepareStatement(query);
				ResultSet rs = stmt.executeQuery()) {
			if (rs.next())
				return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getTotalProducts() {
		String query = "SELECT COUNT(*) FROM product";
		try (Connection conn = DbConfig.getDbConnection();
				PreparedStatement stmt = conn.prepareStatement(query);
				ResultSet rs = stmt.executeQuery()) {
			if (rs.next())
				return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getTotalOrders() {
		String query = "SELECT COUNT(*) FROM cart"; // Adjust if your table is named differently
		try (Connection conn = DbConfig.getDbConnection();
				PreparedStatement stmt = conn.prepareStatement(query);
				ResultSet rs = stmt.executeQuery()) {
			if (rs.next())
				return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Map<String, Integer> getCategoryType() {
		Map<String, Integer> map = new HashMap<>();
		String sql = "SELECT category_type, COUNT(*) AS count FROM category GROUP BY category_type";
		try (Connection conn = DbConfig.getDbConnection();
				PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				map.put(rs.getString("category_type"), rs.getInt("count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
