<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PersonaProveedor
 * 
 * @property int $idPersonaProveedor
 * @property int $idPersona
 * @property string|null $representante
 * @property int|null $idAlterno
 * @property string|null $codiZip
 * @property int $idTipoSeniat
 * @property int $idTipoRetencion
 * @property float|null $porcentajeRetencionIVA
 * @property bool|null $esRetencionIVA
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Persona $persona
 * @property TipoRetencion $tipo_retencion
 * @property TipoSeniat $tipo_seniat
 * @property Collection|Compra[] $compras
 * @property Collection|CuentasPorPagar[] $cuentas_por_pagars
 *
 * @package App\Models
 */
class PersonaProveedor extends Model
{
	protected $table = 'persona_proveedor';
	protected $primaryKey = 'idPersonaProveedor';
	public $timestamps = false;

	protected $casts = [
		'idPersona' => 'int',
		'idAlterno' => 'int',
		'idTipoSeniat' => 'int',
		'idTipoRetencion' => 'int',
		'porcentajeRetencionIVA' => 'float',
		'esRetencionIVA' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idPersona',
		'representante',
		'idAlterno',
		'codiZip',
		'idTipoSeniat',
		'idTipoRetencion',
		'porcentajeRetencionIVA',
		'esRetencionIVA',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function persona()
	{
		return $this->belongsTo(Persona::class, 'idPersona');
	}

	public function tipo_retencion()
	{
		return $this->belongsTo(TipoRetencion::class, 'idTipoRetencion');
	}

	public function tipo_seniat()
	{
		return $this->belongsTo(TipoSeniat::class, 'idTipoSeniat');
	}

	public function compras()
	{
		return $this->hasMany(Compra::class, 'idPersonaProveedor');
	}

	public function cuentas_por_pagars()
	{
		return $this->hasMany(CuentasPorPagar::class, 'idPersonaProveedor');
	}
}
