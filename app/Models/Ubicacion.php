<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Ubicacion
 * 
 * @property int $idUbicacion
 * @property int|null $idMunicipio
 * @property string $descripcion
 * @property string $direccion
 * @property string|null $telefono
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Municipio $municipio
 * @property Collection|Compra[] $compras
 * @property Collection|CuentasPorCobrar[] $cuentas_por_cobrars
 * @property Collection|CuentasPorPagar[] $cuentas_por_pagars
 * @property Collection|Inventario[] $inventarios
 * @property Collection|ItemExistencia[] $item_existencia
 * @property Collection|Venta[] $venta
 *
 * @package App\Models
 */
class Ubicacion extends Model
{
	protected $table = 'ubicacion';
	protected $primaryKey = 'idUbicacion';
	public $timestamps = false;

	protected $casts = [
		'idMunicipio' => 'int',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idMunicipio',
		'descripcion',
		'direccion',
		'telefono',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function municipio()
	{
		return $this->belongsTo(Municipio::class, 'idMunicipio');
	}

	public function compras()
	{
		return $this->hasMany(Compra::class, 'idUbicacion');
	}

	public function cuentas_por_cobrars()
	{
		return $this->hasMany(CuentasPorCobrar::class, 'idUbicacion');
	}

	public function cuentas_por_pagars()
	{
		return $this->hasMany(CuentasPorPagar::class, 'idUbicacion');
	}

	public function inventarios()
	{
		return $this->hasMany(Inventario::class, 'idUbicacion');
	}

	public function item_existencia()
	{
		return $this->hasMany(ItemExistencia::class, 'idUbicacion');
	}

	public function venta()
	{
		return $this->hasMany(Venta::class, 'idUbicacion');
	}
}
