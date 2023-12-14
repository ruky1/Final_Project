package boot.data.service;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.UserDto;

@Mapper
public interface UserServiceInter {
	
	public UserDto getUserById(String id);

}
