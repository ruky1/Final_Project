package boot.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.Dto.UserDto;
import boot.data.mapper.UserMapperInter;
@Service
public class UserService implements UserServiceInter {
	
	@Autowired
	UserMapperInter mapper;

	@Override
	public UserDto getUserById(String id) {
		// TODO Auto-generated method stub
		return mapper.getUserById(id);
	}

}
