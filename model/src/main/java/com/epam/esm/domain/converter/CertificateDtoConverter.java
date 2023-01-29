package com.epam.esm.domain.converter;


import com.epam.esm.domain.entity.Certificate;
import com.epam.esm.domain.payload.CertificateDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CertificateDtoConverter implements DtoConverter<Certificate, CertificateDto> {

    private final TagDtoConverter tagConverter;

    @Autowired
    public CertificateDtoConverter(TagDtoConverter tagConverter) {
        this.tagConverter = tagConverter;
    }

    @Override
    public Certificate toEntity(CertificateDto dto) {
        return new Certificate(
                dto.getId(),
                dto.getName(),
                dto.getDescription(),
                dto.getPrice(),
                dto.getDuration(),
                dto.getCreateDate(),
                dto.getLastUpdateDate(),
                tagConverter.toEntity(dto.getTags())
        );
    }

    @Override
    public CertificateDto toDto(Certificate certificate) {
        return new CertificateDto(
                certificate.getId(),
                certificate.getName(),
                certificate.getDescription(),
                certificate.getPrice(),
                certificate.getDuration(),
                certificate.getCreateDate(),
                certificate.getLastUpdateDate(),
                tagConverter.toDto(certificate.getTags())
        );
    }
}
