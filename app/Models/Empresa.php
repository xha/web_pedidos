<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Empresa
 * 
 * @property int $idEmpresa
 * @property string $rif
 * @property string $razonSocial
 * @property string|null $representante
 * @property string $direccion
 * @property string $correo
 * @property Carbon $fechaLicencia
 * @property Carbon $fechaCreacion
 * @property bool $activo
 *
 * @package App\Models
 */
class Empresa extends Model
{
	protected $table = 'empresa';
	protected $primaryKey = 'idEmpresa';
	public $timestamps = false;

	protected $casts = [
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaLicencia',
		'fechaCreacion'
	];

	protected $fillable = [
		'rif',
		'razonSocial',
		'representante',
		'direccion',
		'correo',
		'fechaLicencia',
		'fechaCreacion',
		'activo'
	];
}
